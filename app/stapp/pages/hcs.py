import streamlit as st
import configparser

from parser import scrapper

config = configparser.ConfigParser()
config.read("settings.ini")


def get_pred(uid = 1):
	ip = config["SERVER"]["ServerIp"]
	res = scrapper.get_page("{}/bill/prediction/{}".format(ip, uid))
	pred = round(res["prediction"], 2)
	return pred


def main():
	st.set_page_config(
        page_title="Прогноз ЖКХ",
	)
	st.sidebar.image("files/logo2.png", width=200)
	st.title("Прогноз ЖКХ")

	user_id = st.text_input("user id", "")

	pred = -1

	if st.button("enter") or user_id:
		if user_id:
			try:
				user_id = int(user_id)
				user_id = 1 # 'cause only 1 works :|
				pred = get_pred(user_id)
			except Exception as ex:
				st.write("wrong input.\ndev: {}".format(ex))

	st.write("Or")
	if st.button("default"):
		pred = get_pred()

	if pred != -1:
		st.write("Прогноз ЖКХ на следующий месяц: {}₽".format(pred))


if __name__ == "__main__":
	main()