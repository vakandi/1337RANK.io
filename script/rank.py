import requests, json,time
USER_ID= "8b17cf21549346b5c2b71fd5f87d9bc5f5255aa479bb4dc571579dd3088f05df"
USER_SECRET= "98ba01ccbe59f2d0ab6da85d273b170e1b3f61776a0121f1604f73f297eb4533"
BASE_URL = "https://api.intra.42.fr"
def return_token():
    r = requests.post(url = BASE_URL+ "/oauth/token",
            data = {"grant_type" : "client_credentials",
                        "client_id": USER_ID,
                        "client_secret": USER_SECRET})
    data = r.json()
    return (data["access_token"])
def fetch_users(token ,page):
    r = requests.get(url = BASE_URL+"/v2/cursus_users",
            params = {"access_token" : token,
                "filter[campus_id]" : 55,
                "page[size]" : 100,
                "page[number]" : page
                },
            )
    return r.json()
def coordination():
    token = return_token()
    users = fetch_users(token,1)
    time.sleep(0.5)
    users +=fetch_users(token,2)
    users = sorted(users, key= lambda k : k["created_at"], reverse=True)
    pats=users[:150]
    pats = sorted(pats, key= lambda k : k["level"], reverse=True)
    for idx,user in enumerate(pats):
        print("{}  {} {}    ".format(idx + 1,user["user"]["login"], user["level"]))
coordination()

