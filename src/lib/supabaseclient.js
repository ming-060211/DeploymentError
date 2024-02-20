import { createClient } from '@supabase/supabase-js'
import { env } from '$env/dynamic/private'

const supabase_url = env.SUPABASE_URL
const supabase_anon = env.SUPABASE_ANON_KEY

console.log("THis is supaurl ", supabase_url)
console.log("THis is supabase anon ", supabase_anon)
export const supabase = createClient(supabase_url, supabase_anon )