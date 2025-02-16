import streamlit as st

st.title("Главное окно - NC Group")

st.sidebar.image("files/logo2.png", width=200)

# st.markdown("Пример приложения с вкладками")
st.query_params["tab"] = "home"