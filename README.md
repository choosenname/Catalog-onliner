# 🛍️ Simple Catalog API (Inspired by Onliner)

A lightweight RESTful API built with Ruby on Rails, modeled after the catalog system of [Onliner.by](https://catalog.onliner.by/). The API supports product listings, categories, specifications, reviews, and more — making it suitable for online marketplace backends, e-commerce platforms, or catalog prototypes.

## 🚀 Features

- 📦 **Product Management**: CRUD operations on products with detailed specifications
- 🧩 **Category Support**: Hierarchical structure and category-based filtering
- ✍️ **Reviews**: User-generated product reviews with ratings
- ⚙️ **Specifications**: General and individual specifications for products
- 📄 **JSON Serialization**: Clean and structured JSON responses with ActiveModel Serializers
- 🔄 **Swagger Integration**: API documentation ready via Swagger (Rswag)
- 🧪 **RSpec Tests**: Coverage for request specs
- 🌐 **CORS Enabled**: Ready for frontend integration

## 🗂️ Project Structure (Simplified)

```graphql
. ├── app/ 
│ ├── controllers/ # RESTful API controllers 
│ ├── models/ # Mongoid models (Product, Category, Review...) 
│ ├── serializers/ # JSON serializers 
│ └── views/ # Mailer views 
├── config/ 
│ ├── routes.rb # API routes 
│ ├── mongoid.yml # MongoDB config 
│ └── initializers/ # Swagger, CORS, etc. 
├── spec/ # RSpec tests & Swagger docs 
├── swagger/ # Swagger YAML definition 
├── Dockerfile # Dockerized environment 
├── Gemfile # Dependencies 
└── README.md
```

## 🛠️ Tech Stack

- **Ruby on Rails** (API mode)
- **MongoDB** with **Mongoid**
- **RSpec** + **Rswag** for testing & documentation
- **Docker** for containerization
- **ActiveModel Serializers**

## 📦 Getting Started

### Prerequisites

- Docker / Docker Compose
- Make or Bash

### Run with Docker

```bash
docker build -t catalog-api .
docker run -p 3000:3000 catalog-api
```

### Or run locally
```bash
bundle install
rails db:setup
rails s
```

### View Swagger Docs
Once the app is running, navigate to:
```bash
http://localhost:3000/api-docs
```

## 🧪 Run Tests
```bash
bundle exec rspec
```
## 📝 API Overview
GET /products

GET /categories

GET /products/:id/reviews

POST /products/:id/reviews

Check the full docs at /api-docs.

## 📄 License
This project is licensed under the MIT License.
