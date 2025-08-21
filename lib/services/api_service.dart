import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/quote.dart';

class ApiService {
  static const String _baseUrl = 'https://api.allorigins.win/raw?url=https://zenquotes.io/api';
  static const Duration _timeout = Duration(seconds: 10);

  /// Fetches a random quote from the ZenQuotes API
  static Future<Quote> fetchRandomQuote() async {
    try {
      final response = await http
          .get(
            Uri.parse('$_baseUrl/random'),
            headers: {'Content-Type': 'application/json'},
          )
          .timeout(_timeout);

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        if (jsonData.isNotEmpty) {
          // ZenQuotes returns an array with one quote
          final quoteData = jsonData[0];
          return Quote(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            content: quoteData['q'] ?? '',
            author: quoteData['a'] ?? 'Unknown',
            tags: [], // ZenQuotes doesn't provide tags
          );
        } else {
          throw Exception('No quotes received from API');
        }
      } else {
        throw HttpException(
          'Failed to fetch quote. Status code: ${response.statusCode}',
        );
      }
    } on SocketException {
      throw const SocketException(
        'No internet connection. Please check your network and try again.',
      );
    } catch (e) {
      throw Exception('An unexpected error occurred: ${e.toString()}');
    }
  }

  /// Fetches multiple random quotes for preloading
  static Future<List<Quote>> fetchMultipleQuotes({int count = 5}) async {
    List<Quote> quotes = [];
    
    try {
      for (int i = 0; i < count; i++) {
        final quote = await fetchRandomQuote();
        quotes.add(quote);
        // Small delay to avoid hitting rate limits
        await Future.delayed(const Duration(milliseconds: 100));
      }
      return quotes;
    } catch (e) {
      // If we fail partway through, return what we have
      if (quotes.isNotEmpty) {
        return quotes;
      }
      rethrow;
    }
  }
}