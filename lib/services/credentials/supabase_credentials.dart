import 'package:supabase/supabase.dart';

class SupabaseCredentials{
  static const String APIKEY="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTYzMjY0NjQ5MCwiZXhwIjoxOTQ4MjIyNDkwfQ.NfCYxZvnDP-jImk5Md81Q1Ihl3oU2VRcvAniGiHYRc0";
  static const String APIURL="https://zjftuujayqrwhaahyazs.supabase.co";

  static SupabaseClient supabaseClient =SupabaseClient(APIURL,APIKEY);
  
}