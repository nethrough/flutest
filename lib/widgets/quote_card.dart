import 'package:flutter/material.dart';
import '../models/quote.dart';

class QuoteCard extends StatelessWidget {
  final Quote quote;
  final bool isVisible;

  const QuoteCard({
    super.key,
    required this.quote,
    this.isVisible = true,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isTablet = screenSize.width > 600;

    return AnimatedOpacity(
      opacity: isVisible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 500),
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: isTablet ? 60 : 20,
          vertical: 40,
        ),
        padding: EdgeInsets.all(isTablet ? 40 : 24),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white.withOpacity(0.2),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Quote icon
            Icon(
              Icons.format_quote,
              size: isTablet ? 48 : 36,
              color: Colors.white.withOpacity(0.7),
            ),
            
            const SizedBox(height: 30),
            
            // Quote content
            Text(
              quote.content,
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontSize: isTablet ? 32 : 24,
                fontWeight: FontWeight.w300,
                height: 1.5,
                letterSpacing: 0.5,
              ),
              textAlign: TextAlign.center,
            ),
            
            const SizedBox(height: 30),
            
            // Author name
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 30,
                  height: 1,
                  color: Colors.white.withOpacity(0.5),
                ),
                const SizedBox(width: 16),
                Text(
                  quote.author,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: isTablet ? 20 : 16,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(width: 16),
                Container(
                  width: 30,
                  height: 1,
                  color: Colors.white.withOpacity(0.5),
                ),
              ],
            ),
            
            // Tags (if available)
            if (quote.tags.isNotEmpty) ...[
              const SizedBox(height: 20),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: quote.tags.take(3).map((tag) => Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.3),
                      width: 0.5,
                    ),
                  ),
                  child: Text(
                    tag,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                )).toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}