#!/bin/bash

source ./setup_build_env.sh

gcloud builds submit --substitutions=_SUPABASE_URL_PARAM=$SUPABASE_URL_PARAM,_SUPABASE_ANON_KEY_PARAM=$SUPABASE_ANON_KEY_PARAM

gcloud run deploy supaauth --image gcr.io/hive-347910/supaauth:latest --region=europe-west1 --allow-unauthenticated
