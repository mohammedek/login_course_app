import 'package:flutter/material.dart';
import 'package:login_course_app/utils/app_textstyles.dart';
import 'package:provider/provider.dart';


import '../../providers/search_state_provider.dart';
import '../../utils/app_colors.dart';



class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});



  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( // corrected 'returnScaffold' to 'return Scaffold'
        appBar: AppBar(
          surfaceTintColor: AppColors.whiteColor,
          title: const Text('Search'),
          centerTitle: true,
          titleTextStyle: AppTextStyles.appBarTextStyle,
        ),
        body: ChangeNotifierProvider(
          create: (_) => SearchState(),
          child: Consumer<SearchState>(
            builder: (context, state, child) {
              return Column(
                children: [
                  TextField(
                    onChanged: state.onSearchTextChanged,
                    decoration: InputDecoration(
                      hintText: 'Enter at least 3 characters to search',
                      hintStyle: const TextStyle(fontSize: 16.0, color: Colors.grey),
                      prefixIcon: const Icon(Icons.search, color: Colors.blue),
                      filled: true,
                      fillColor: Colors.grey[200], // Light grey background
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0), // Padding
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0), // Rounded corners
                        borderSide: const BorderSide(color: Colors.transparent), // Remove border
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Colors.transparent), // Remove border
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Colors.blue, width: 2.0), // Blue border on focus
                      ),
                    ),
                  ),
                  if (state.searchText.isNotEmpty)
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.searchResults.length,
                        itemBuilder: (context, index) {
                          final result = state.searchResults[index];
                          return ListTile(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Padding
                            leading: CircleAvatar(
                              backgroundColor: Colors.grey[200], // Light grey background
                              backgroundImage: result['imageUrl'] != null && result['imageUrl'].isNotEmpty
                                  ? NetworkImage(result['imageUrl']!)
                                  : null, // Set image if available
                              child: result['imageUrl'] == null || result['imageUrl'].isEmpty
                                  ? Text(result['title'][0])
                                  : null, // Placeholder text for no image
                            ),
                            title: Text(
                              result['title'],
                              style: const TextStyle(fontSize: 16.0), // Adjust font size
                            ),
                            subtitle: Text(
                              result['subtitle'] ?? '', // Display subtitle if available
                              style: const TextStyle(fontSize: 14.0, color: Colors.grey), // Adjust subtitle style
                            ),
                          );
                        },
                      ),
                    ),
                ],
              );
            },
          ),
        ));
  }
}
