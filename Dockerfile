FROM node:18-alpine AS builder
ARG SUPABASE_URL_PARAM
ARG SUPABASE_ANON_KEY_PARAM
ENV SUPABASE_URL=$SUPABASE_URL_PARAM
ENV SUPABASE_ANON_KEY=$SUPABASE_ANON_KEY_PARAM
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build
RUN npm prune --production

FROM node:18-alpine
EXPOSE 3000
ENV NODE_ENV=development
ARG SUPABASE_URL_PARAM
ARG SUPABASE_ANON_KEY_PARAM
ENV SUPABASE_URL=$SUPABASE_URL_PARAM
ENV SUPABASE_ANON_KEY=$SUPABASE_ANON_KEY_PARAM
WORKDIR /app
COPY --from=builder /app/src /app/src
COPY --from=builder /app/build ./
COPY --from=builder /app/node_modules node_modules/
COPY package.json ./

CMD [ "node", "./index.js" ]