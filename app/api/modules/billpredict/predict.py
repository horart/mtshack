from statsmodels.tsa.statespace.sarimax import SARIMAX
from statsmodels.tsa.stattools import adfuller
from statsmodels.graphics.tsaplots import plot_acf, plot_pacf
from sklearn.metrics import mean_absolute_error, mean_squared_error
import pandas as pd

class Predictor:
    def predict(last_months) -> float:
        data = pd.Series([i['sum'] for i in last_months], index=[i['month'] for i in last_months])
        print(data)
        model = SARIMAX(data, order=(1, 1, 1), seasonal_order=(0, 1, 0, 12))
        result = model.fit()
        return result.get_forecast(steps=1).predicted_mean.iloc[0]


# import pandas as pd
# import numpy as np
# import matplotlib.pyplot as plt
# from datetime import datetime, timedelta
# from statsmodels.tsa.statespace.sarimax import SARIMAX


# class Model:
#     def __init__(self, df):
#         self.df = df
#         self.global_results = None
#         self.user_forecasts = None

#     def train(self):
#         # Обучаем модель на общем тренде всех пользователей
#         global_series = df.mean(axis=1)
#         global_model = SARIMAX(global_series, order=(6,1,1), seasonal_order=(1,1,1,12))

#         self.global_results = global_model.fit()

#     def forecast(self, forecast_steps = 6):
#         user_forecasts = {}

#         for user in self.df.columns:
#             data = self.df[user].copy()
#             data.index = pd.to_datetime(data.index)
#             inferred_freq = pd.infer_freq(data.index)
#             inferred_freq = inferred_freq if inferred_freq else 'M'
#             data = data.asfreq(inferred_freq)

#             user_results = self.global_results.apply(data)
#             forecast_values = user_results.forecast(steps=forecast_steps)

#             last_date = data.index[-1]
#             forecast_dates = pd.date_range(start=last_date + pd.DateOffset(1), periods=forecast_steps, freq=inferred_freq)

#             self.user_forecasts[user] = pd.Series(forecast_values.values, index=forecast_dates)
#             return self.user_forecasts
    
#     def visualize(self):
#         plt.figure(figsize=(12, 6))
#         for user in self.df.columns:
#             plt.plot(self.df.index, self.df[user], label=f"{user} - Исторические данные", linewidth=2)
#             plt.plot(user_forecasts[user].index, self.user_forecasts[user], linestyle='dashed', label=f"{user} - Прогноз", linewidth=2)

#         plt.legend()
#         plt.title('Исторические данные и прогноз потребления пользователей')
#         plt.xlabel('Дата')
#         plt.ylabel('Потребление')
#         plt.grid()
#         plt.show()



# # Генерируем 48 месяцев (4 года) с шагом 30 дней (~месяц)
# dates = [datetime(2020, 1, 1) + timedelta(days=30 * i) for i in range(48)]

# # Функция генерации временного ряда для пользователя
# def generate_time_series():
#     trend = np.linspace(50, 60, 48)  # Линейный тренд
#     seasonality = 1 * np.sin(2 * np.pi * np.arange(48) / 12)  # Годовая синусоида
#     noise = np.random.randn(48) * 0.2  # Случайный шум
#     return trend + seasonality + noise

# # Генерируем данные для 3 пользователей
# user_data = {
#     'user_1': generate_time_series(),
#     'user_2': generate_time_series() + 5,  # Смещение на 5 вверх
#     'user_3': generate_time_series() - 3,  # Смещение на 3 вниз
# }

# # Создаем DataFrame
# df = pd.DataFrame(user_data, index=dates)
# model = Model(df)