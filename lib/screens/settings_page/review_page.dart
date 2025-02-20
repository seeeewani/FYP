import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  final TextEditingController _reviewController = TextEditingController();
  double _rating = 0;

  List<Map<String, dynamic>> reviews = [
    {"name": "Alex Johnson", "rating": 4.5, "review": "Great service!"},
    {"name": "Emma Smith", "rating": 5.0, "review": "Highly recommended!"},
    {"name": "John Doe", "rating": 3.5, "review": "Could be improved."},
  ];

  void _submitReview() {
    if (_reviewController.text.isNotEmpty && _rating > 0) {
      setState(() {
        reviews.add({
          "name": "You",
          "rating": _rating,
          "review": _reviewController.text,
        });
      });
      _reviewController.clear();
      _rating = 0;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Review submitted successfully!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFECE1F0),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 30, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Reviews & Recommendations",
          style: GoogleFonts.lato(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Reviews List
            Text(
              "Customer Reviews",
              style: GoogleFonts.lato(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: reviews.length,
                itemBuilder: (context, index) {
                  return _buildReviewTile(
                    reviews[index]["name"],
                    reviews[index]["rating"],
                    reviews[index]["review"],
                  );
                },
              ),
            ),
            const SizedBox(height: 5),

            // Rating and Review Input
            Text(
              "Leave a Review",
              style: GoogleFonts.lato(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(height: 5),

            Row(
              children: [
                Text(
                  "Rating:",
                  style: GoogleFonts.lato(fontSize: 20, color: Colors.black),
                ),
                const SizedBox(width: 10),
                _buildRatingStars(),
              ],
            ),
            const SizedBox(height: 5),
            TextField(
              controller: _reviewController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: "Write your review...",
                hintStyle: TextStyle(
                  fontSize: 15,
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _submitReview,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Center(
                child: Text(
                  "Submit Review",
                  style: GoogleFonts.lato(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Review Tile Widget
  Widget _buildReviewTile(String name, double rating, String review) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.person, color: Colors.black, size: 24),
              const SizedBox(width: 8),
              Text(
                name,
                style:
                    GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Text(
                "$rating ★",
                style: GoogleFonts.lato(fontSize: 16, color: Colors.red),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            review,
            style: GoogleFonts.lato(fontSize: 16, color: Colors.black87),
          ),
        ],
      ),
    );
  }

  // Rating Stars Widget
  Widget _buildRatingStars() {
    return Row(
      children: List.generate(5, (index) {
        return IconButton(
          icon: Icon(
            index < _rating ? Icons.star : Icons.star_border,
            color: Colors.red,
          ),
          onPressed: () {
            setState(() {
              _rating = index + 1.0;
            });
          },
        );
      }),
    );
  }
}
