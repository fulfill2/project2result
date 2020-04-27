import os
import pymysql
from datetime import datetime
from flask import Flask, render_template
from flask import request, redirect, abort, session, jsonify
from selenium import webdriver
from bs4 import BeautifulSoup
import re

options = webdriver.ChromeOptions()
options.add_argument('--headless')
options.add_argument('--no-sandbox')
options.add_argument('--disable-dev-shm-usage')
driver = webdriver.Chrome('chromedriver.exe', options=options)

app = Flask(__name__, 
            static_folder="static",
            template_folder="views")
app.config['ENV'] = 'development'
app.config['DEBUG'] = True
app.secret_key = 'sookbun'

db = pymysql.connect(
    user='root',
    passwd='123456',
    host='localhost',
    db='songs',
    charset='utf8',
    cursorclass=pymysql.cursors.DictCursor
)

def get_menu():
    cursor = db.cursor()
    cursor.execute("select id, songtitle from content")
    menu = [f"<li><a href='/{row['id']}'>{row['songtitle']}</a></li>"
            for row in cursor.fetchall()]
    return '\n'.join(menu)
    
def get_template(filename):
    with open('views/' + filename, 'r', encoding="utf-8") as f:
        template = f.read()
        
    return template

@app.route("/")
def index():    
    if 'user' in session:
        title = 'Welcome ' + session['user']['name']
        menu = get_menu()
        button_name = "logout"
        button_name_member = "회원정보수정"
    else:
        title = 'Welcome'
        menu = ""
        button_name = "login"
        button_name_member ="회원가입"
        
    message = '노래 가사집에 오신 것을 환영합니다.'
    return render_template('template.html',
                           id="",
                           title=title,
                           lyrics =message,
                           url = "",
                           menu=menu,
                           button_name = button_name,
                          button_name_member = button_name_member)
                       

@app.route("/<id>")
def html(id):
    cursor = db.cursor()
    cursor.execute(f"select * from content where id = '{id}'")
    topic = cursor.fetchone()
    button_name_member ="회원정보수정"
    if topic is None:
        abort(404)

    return render_template('template.html',
                           id=topic['id'],
                           title=topic['songtitle'],
                           lyrics=topic['lyrics'],
                           url =topic['url'],
                           menu=get_menu(),
                           button_name = "logout",
                           button_name_member =button_name_member
                          )


@app.route("/delete/<id>")
def delete(id):
    cursor = db.cursor()
    cursor.execute(f"delete from content where songtitle='{id}'")
    db.commit()
    
    return redirect("/")

@app.route("/create", methods=['GET', 'POST'])
def create():

    if request.method == 'POST':
        cursor = db.cursor()
        title = request.form['title']
 
        url_lyrics = "https://www.genie.co.kr"
        driver.get(url_lyrics)
        driver.find_element_by_xpath('//*[@id="sc-fd"]').clear()
        driver.find_element_by_xpath('//*[@id="sc-fd"]').send_keys(title)
        driver.find_element_by_xpath('//*[@id="frmGNB"]/fieldset/input[3]').click()
        driver.find_element_by_css_selector('a.btn-info').click()
        soup = BeautifulSoup(driver.page_source, 'html.parser')         
        lyrics = soup.select("pre#pLyrics p")       

        url_youtube = f"https://www.youtube.com/results?search_query={title}"
        driver.get(url_youtube)
        soup_youtube = BeautifulSoup(driver.page_source, 'html.parser') 
        img = soup_youtube.select("img#img")[0]['src']
        regex = re.compile('https://i.ytimg.com/vi/(.+)/')
        url = re.findall(regex, img)
        youtube_form = f'<iframe width="560" height="315" src="https://www.youtube.com/embed/{url[0]}" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>'
        
        
        sql = f"""
            insert into content (songtitle, lyrics, created, url, author_id)
            values ('{request.form['title']}', '{lyrics[0].get_text()}',
                    '{datetime.now()}', '{youtube_form}', '4')
        """
        cursor.execute(sql)
        db.commit()
        cursor.execute(f"select * from content where songtitle = '{title}'")
        topic = cursor.fetchone()

        return redirect(f"/{topic['id']}")
    
    return render_template('create.html', 
                           title='신규 추가', 
                           menu=get_menu(),
                           )


@app.route('/update/<title>', methods=['GET', 'POST'])
def update(title):
    cursor = db.cursor()
    cursor.execute(f"select * from content where songtitle = '{title}'")
    topic = cursor.fetchone()
    if request.method == 'GET':
        return render_template('update.html',
                       title=topic['songtitle'],
                       lyrics=topic['lyrics'],
                       menu=get_menu(),
                        url = topic['url']
                              )


    elif request.method == 'POST':
        button_name_member ="회원정보수정"
        sql = f"""update content set
                  songtitle = '{request.form['title']}',
                  lyrics = '{request.form['lyrics']}',
                  url = '{request.form['url']}',
                  created = '{datetime.now()}',
                  author_id = '{session['user']['id']}'
                  where songtitle = '{title}'"""

        cursor.execute(sql)
        db.commit()
        cursor.execute(f"select * from content where songtitle = '{title}'")
        topic = cursor.fetchone()
        return render_template('template.html',
                               title=topic['songtitle'],
                               lyrics=topic['lyrics'],
                               menu=get_menu(),
                               url =topic['url'],
                               button_name = "logout",
                               button_name_member =button_name_member
                              )



@app.route("/login", methods=['GET', 'POST'])
def login():
    message = ""
    if request.method == 'POST':
        cursor = db.cursor()
        cursor.execute(f"""
            select id, name, password from author 
            where name = '{request.form['id']}'""")
        user = cursor.fetchone()
        
        if user is None:
            message = "<p>회원이 아닙니다.</p>"
        else:
            cursor.execute(f"""
            select id, name, password from author 
            where name = '{request.form['id']}' and 
                  password = SHA2('{request.form['password']}', 256)""")
            user = cursor.fetchone()
            
            if user is None:
                message = "<p>패스워드를 확인해 주세요</p>"
            else:
                # 로그인 성공에는 메인으로
                
                session['user'] = user
                
                return redirect("/")
    
    return render_template('login.html', 
                           message=message, 
                           menu=get_menu())

@app.route('/logout')
def logout():
    session.pop('user', None)
    return redirect('/')

@app.route("/favicon.ico")
def favicon():
    return abort(404)



@app.route("/create_member",  methods=['get', 'post'])
def members():
    cursor =db.cursor()
#     if request.method == 'GET':
#         cursor.execute("select * from author where autor")    
#         return render_template('template.html',
#            id="",
#            title=title,
#            content=jsonify(cursor.fetchall()),
#            menu=get_menu())
    message =""
    title = "회원정보수정"
    if 'user' in session:
        user_name = session['user']['name']
        if request.method == 'POST':
            sql = f"""update author set
                      name = '{request.form['name']}',
                      password = SHA2('{request.form['password']}', 256)
                      where name = '{user_name}'
                    """

            cursor.execute(sql)
            db.commit()
            message = "회원정보변경에 성공하였습니다."
            return render_template('template_members.html', 
                       title=title,
                       message=message
                       )

        return render_template('template_members.html', 
                       title=title,
                       message=message
                       )
    else:
        title = "회원가입"
        message = ""
        if request.method == 'POST':
            sql = f"""insert into author (name, password)
                      values ('{request.form['name']}',
                      SHA2('{request.form['password']}', 256))"""
            cursor.execute(sql)
            db.commit()
            message = "회원가입성공!"
            return redirect("/login")
        return render_template('template_members.html', 
                                   title=title,
                                   message=message
                                   )




app.run(port=8000)