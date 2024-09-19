# Nginx Dockerfile
FROM nginx:1.14-alpine

# TimeZone 환경 변수 지정
ENV TZ=Asia/Seoul

# Nginx 설정 파일 복사
COPY nginx.conf /etc/nginx/

# Static files 복사
COPY dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
