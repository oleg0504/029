import requests
from bs4 import BeautifulSoup


def get_song_name():
    r = requests.get("https://play.tavr.media/hitfm/")
    content = r.content
    soup = BeautifulSoup(content, "html.parser")
    result = str(soup.find("div", {"class": "singer-song-centre first_song"}).text).replace("\n", "").replace(
        "                            ", " ")
    return result


with open("/home/che/Desktop/Song_list.txt", "a") as song_list:
    song_list.write(get_song_name())
    song_list.write("\n")
