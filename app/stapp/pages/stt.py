import streamlit as st
import configparser

from parser import scrapper

config = configparser.ConfigParser()
config.read("settings.ini")


def get_pred():
	ip = config["SERVER"]["ServerIp"]
	files = {'upload_file': open('files/stt.wav','rb')}
	res = scrapper.post_page("{}/stt".format(ip), files)
	return res


def main():
	st.set_page_config(
		page_title="stt",
	)
	st.sidebar.image("files/logo2.png", width=200)
	st.title("stt")

	uploaded_file = st.file_uploader("Choose an audio", ["wav"])
	if uploaded_file is not None:
		with open('files/stt.wav', 'wb') as f:
			f.write(uploaded_file.getvalue())

	pred = ""

	if st.button("get"):
		pred = get_pred()

	if pred != "":
		st.write("tts: {}".format(pred["text"]))


if __name__ == "__main__":
	main()