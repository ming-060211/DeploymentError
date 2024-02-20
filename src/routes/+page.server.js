import { env } from "$env/dynamic/private"
import { supabase } from "$lib/supabaseclient";

export const load = async (event) => {
    let tem = env.SUPABASE_URL
    let tem2 = env.SUPABASE_ANON_KEY



    const {data } = await supabase.from('printer').select()

    return {
        printers: data ?? [] , tem, tem2
    }


}