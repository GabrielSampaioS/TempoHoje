
# 🌤️ Tempo Hoje

Aplicativo de previsão do tempo desenvolvido em **Flutter**, consumindo a **API da OpenWeather**, com foco em boas práticas, separação de responsabilidades e arquitetura simples para estudo e evolução contínua.

---

## Visão Geral

O **Tempo Hoje** permite:

- Buscar cidades pelo nome
- Obter o **clima atual** da localização selecionada
- Exibir:
  - Temperatura atual
  - Temperatura mínima e máxima
  - Umidade
  - Velocidade do vento
  - Descrição do clima
  - Ícone oficial da OpenWeather

O projeto utiliza **Provider** para gerenciamento de estado e segue uma estrutura inspirada em **MVVM**.

---

## Arquitetura

```
lib/
├── app/
│   ├── datasources/
│   │   └── weather_datasource.dart
│   ├── model/
│   │   ├── location_model.dart
│   │   └── weather_model.dart
│   ├── viewmodels/
│   │   └── location_by_city.dart
│   └── views/
│       └── widgets/
│           └── preve_hoje.dart
```

---

## Integração com OpenWeather

### 🔹 Geocoding (busca por cidade)

```
GET https://api.openweathermap.org/geo/1.0/direct
```

Parâmetros:
- `q`: nome da cidade
- `limit`: quantidade de resultados
- `appid`: chave da API

---

###  Clima atual

```
GET https://api.openweathermap.org/data/2.5/weather
```

Parâmetros:
- `lat`: latitude
- `lon`: longitude
- `lang`: idioma
- `appid`: chave da API

 Apenas endpoints gratuitos são utilizados.

---

##  Ícones de clima

```
https://openweathermap.org/img/wn/{icon}@2x.png
```

O `{icon}` vem diretamente da resposta da API.

---

## Conversão de temperatura

A API retorna a temperatura em **Kelvin**.

```
°C = Kelvin - 273
```

---

## 🧩 Widget PreveHoje

Responsável por renderizar os dados climáticos do dia atual utilizando Provider e ViewModel.

---

## Tecnologias

- Flutter
- Dart
- Provider
- HTTP
- OpenWeather API

---

##  Como rodar

```bash
flutter pub get
flutter run
```

Configure sua API Key da OpenWeather antes de rodar.

---

## 👨‍💻 Autor

Gabriel Sampaio  
