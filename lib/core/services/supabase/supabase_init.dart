import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SupabaseInit {
  Future<void> initSupabase() async {
    await Supabase.initialize(
      url: '${dotenv.env['SUPABASE_URL']}',
      anonKey: '${dotenv.env['SUPABASE_KEY']}',
    );
  }
}
