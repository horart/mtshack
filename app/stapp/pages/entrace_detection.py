import streamlit as st
import configparser

from parser import scrapper

config = configparser.ConfigParser()
config.read("settings.ini")


# def get_pred(cid = 1):
# 	ip = config["SERVER"]["ServerIp"]
# 	res = scrapper.get_page("{}/entracecam/{}".format(ip, cid))
# 	return res


def main():
	st.set_page_config(
        page_title="Entrace Detection",
	)
	st.sidebar.image("files/logo2.png", width=200)
	st.title("Entrace Detection")

	cam_id = st.text_input("camera id", "")

	pred = -1

	ip = config["SERVER"]["ServerIp"]
	if not cam_id:
		cam_id = 1
	st.video(data="{}/entrancecam/{}".format(ip, cam_id))

	# if st.button("enter") or cam_id:
	# 	if cam_id:
	# 		try:
	# 			cam_id = int(cam_id)
	# 			pred = get_pred(cam_id)
	# 		except Exception as ex:
	# 			st.write("wrong input.\ndev: {}".format(ex))

	# st.write("Or")
	# if st.button("default"):
	# 	pred = get_pred()

	# if pred != -1:
	# 	st.write("Entrace Detection: {}".format(pred))


if __name__ == "__main__":
	main()