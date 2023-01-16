import requests
import sys
import time

USER_ID= "u-s4t2ud-4e64ea992c23df75de2bbd80293f51aa0ac0a84ea354af2c1072c856e5829b7b"
USER_SECRET= "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"
def get_access_token() -> str:
    payload = {
        "grant_type": "client_credentials",
        "client_id": USER_ID,
        "client_secret": USER_SECRET
    }
    r = requests.post("https://api.intra.42.fr/oauth/token", payload)
    if (r.status_code != 200):
        print("an error has occured fetching the token, user_secret is probably outdated")
        return None
    token = r.json()["access_token"]
    return token

def get_user_coalition(token: str, user: str) -> dict:
    p = { "access_token": token }
    r = requests.get(f"https://api.intra.42.fr/v2/users/{user}/coalitions", p)
    if (r.status_code != 200):
        print("an error has occured fetching the user's coalition, the user probably doesnt exist or we got rate limited")
        return None
    dct = {}
    js = r.json()
    dct["login"] = user
    dct["coalition"] = js[0]["name"]
    return dct



def main():
    argc = len(sys.argv)
    if (argc == 1):
        print("not enough arguments passed.")
        return
    token = get_access_token()
    if (token == None):
        return
    for x in range(1, argc):
        user_coalition = get_user_coalition(token, sys.argv[x])
        if (user_coalition == None):
            return
        print(user_coalition)
        time.sleep(0.5)
    return

if __name__ == "__main__":
    main()
