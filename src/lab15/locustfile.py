#!/usr/bin/python

import random
from locust import HttpLocust, TaskSet

def home(l):
    l.client.get("/")

def about(l):
    l.client.get("/Home/About")

def contact(l):
    l.client.get("/Home/Contact")

def blog(l):
    l.client.get("/Home/Blog")

class UserBehavior(TaskSet):

    def on_start(self):
        home(self)

    tasks = {
        home: 1,
        about: 2,
        contact: 10,
        blog: 2
    }

class WebsiteUser(HttpLocust):
    task_set = UserBehavior
    min_wait = 1000
    max_wait = 10000
