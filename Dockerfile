FROM node:18-alpine AS builder
ARG SUPABASE_URL_PARAM
ARG SUPABASE_ANON_KEY_PARAM
ENV SUPABASE_URL=$SUPABASE_URL_PARAM
ENV SUPABASE_ANON_KEY=$SUPABASE_ANON_KEY_PARAM
RUN echo $SUPABASE_URL
RUN echo $SUPABASE_ANON_KEY
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . ./
RUN npm run build
RUN npm prune --production

FROM node:18-alpine
WORKDIR /app
COPY --from=builder /app/build build/
COPY --from=builder /app/node_modules node_modules/
COPY package.json .
EXPOSE 3000
ENV NODE_ENV=development
CMD [ "node", "build" ]