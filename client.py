import etcd3
import os
from flask import Flask, render_template, flash, request
from wtforms import Form, TextField, TextAreaField, validators, StringField, SubmitField
 
# App config.
DEBUG = False
app = Flask(__name__)
app.config.from_object(__name__)
app.config['SECRET_KEY'] = '7d441f27d441f27567d441f2b6176a'

#Output etcd serer to terminal
print (str(os.environ['ETCDSERVER']))
#etcd config
etcd3 = etcd3.client(host=(os.environ['ETCDSERVER']))
test = "test"
etcd3.put('/message', test)
etcd3.get('/message')
 
class ReusableForm(Form):
    name = TextField('Name:', validators=[validators.required()])
 
 
@app.route("/", methods=['GET', 'POST'])
def hello():
    form = ReusableForm(request.form)
 
    print form.errors
    if request.method == 'POST':
        name=request.form['name']
        print name
 
        if form.validate():
            # Save the comment here.
            etcd3.put('/message', name)
            flash('Message: ' + str(tuple(etcd3.get('/message'))))
        else:
            flash('All the form fields are required. ')
 
    return render_template('client.html', form=form)
 
if __name__ == "__main__":
    app.run(host='0.0.0.0', port= 5000)