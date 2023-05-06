# Use uma Imagem Official do Python
FROM python:rc-slim

# Definindo o diretório onde a aplicação será armazenada
WORKDIR /app

# Copiar os arquivos da pasta local para dentro do container
COPY . /app

# Set environment variables
ENV CLOUD_SQL_USERNAME=root
ENV CLOUD_SQL_PASSWORD=87654321
ENV CLOUD_SQL_DATABASE_NAME=spotmusic-9aso-grupo9-database
ENV DB_LOCAL_HOST='35.202.65.25'
ENV CLOUD_SQL_CONNECTION_NAME=grupo-09-384916:us-central1:spotmusic-9aso-grupo9-database-instance

# Instalar as dependências de Python de acordo com o que foi desenvolvido na aplicação e que está declarado no arquivo requirements.txt.
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Garante que será iniciado a aplicação.
CMD ["gunicorn", "app:app"]