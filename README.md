# curso-allura
#how to run sample
docker run -d -p 8080:3000 -v "$(pwd):/var/www" -w "/var/www" node npm start