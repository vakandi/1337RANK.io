import requests, json,time
USER_ID= "u-s4t2ud-4e64ea992c23df75de2bbd80293f51aa0ac0a84ea354af2c1072c856e5829b7b"
USER_SECRET= "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"
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
    pats=users[:200]
    pats = sorted(pats, key= lambda k : k["level"], reverse=True)
    for idx,user in enumerate(pats):
        print("{}  {} {}    ".format(idx + 1,user["user"]["login"], user["level"]))
coordination()

