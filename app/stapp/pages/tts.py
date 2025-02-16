import streamlit as st
import configparser
import base64

from parser import scrapper

config = configparser.ConfigParser()
config.read("settings.ini")


def get_pred(message):
	ip = config["SERVER"]["ServerIp"]
	res = scrapper.get_page("{}/tts".format(ip), {"message": message})
	with open('files/tts.wav', 'wb') as file:
		file.write(res.content)
	return 1


def main():
	st.set_page_config(
		page_title="tts",
	)
	st.sidebar.image("files/logo2.png", width=200)
	st.title("tts")

	pred = -1

	text = st.text_input("text", "")

	if st.button("enter") or text:
		if text:
			pred = get_pred(text)

	if pred != -1:
		# st.write("tts response: {}".format(pred))
		with open("files/tts.wav", "rb") as f:
			file_data = f.read()
		b64 = base64.b64encode(file_data).decode()
		href = f'<a href="data:file/octet-stream;base64,{b64}" download="{"files/tts.wav"}">Скачать файл</a>'
		st.markdown(href, unsafe_allow_html=True)



if __name__ == "__main__":
	main()