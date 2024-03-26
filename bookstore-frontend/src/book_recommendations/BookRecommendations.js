import React, { useState, useEffect } from 'react';

function BookRecommendations() {
  const [books, setBooks] = useState([]);

  useEffect(() => {
    // May need to adjust later the endpoint as needed if I deploy my API somewhere else
    fetch('http://localhost:3000/recommendations?query=Ruby')
      .then(response => response.json())
      .then(data => setBooks(data.slice(0, 10))); // Limit to 10 books for simplicity
  }, []);

  return (
    <div>
      <h2>Book Recommendations</h2>
      <ul>
        {books.map((book, index) => (
          <li key={index}>{book.title}</li>
        ))}
      </ul>
    </div>
  );
}

export default BookRecommendations;