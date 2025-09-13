FROM node:20

LABEL maintainer="wingnut0310 <wingnut0310@gmail.com>"

# Ortam değişkenleri
ENV PORT=3000

# wetty'yi kur
RUN npm install -g wetty

# Portu aç
EXPOSE 3000

# Bash shell ile web terminal başlat
CMD ["wetty", "--port", "3000", "--command", "bash"]
