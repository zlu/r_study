library(tidyverse)

# Create vectors for song data
song_titles <- c("Blinding Lights", "Shape of You", "Bohemian Rhapsody", "Rolling in the Deep", "Uptown Funk")
artists <- c("The Weeknd", "Ed Sheeran", "Queen", "Adele", "Bruno Mars")
popularity <- c(92, 88, 75, 82, 90)
duration <- c(200, 233, 354, 228, 270)  # in seconds
tempo <- c(171, 96, 72, 105, 115)       # in BPM

# Combine into a tibble (a modern data frame from {tidyverse})
spotify_data <- tibble(
  title = song_titles,
  artist = artists,
  popularity = popularity,
  duration = duration,
  tempo = tempo
)

# View the dataset
print(spotify_data)

# Extract vectors
popularity_vec <- spotify_data$popularity
duration_vec <- spotify_data$duration

# Check the vectors
print(popularity_vec)
print(duration_vec)

# Find the Average Popularity
mean_popularity <- mean(popularity_vec)
cat("Average song popularity:", mean_popularity, "\n")

# Convert Duration from Seconds to Minutes
duration_minutes <- duration_vec / 60
print(duration_minutes)

# Identify Songs Above Average Popularity
above_avg <- popularity_vec > mean_popularity
print(above_avg)
song_titles[above_avg]

# Filter by Tempo
fast_tempo <- tempo > 100
fast_songs <- spotify_data[fast_tempo, ]
print(fast_songs)

# Sort by Popularity (Descending)
ordered_fast_songs <- fast_songs[order(fast_songs$popularity, decreasing = TRUE), ]
print(ordered_fast_songs)

# Combine tempo and popularity to create a new variable -> danceability!
danceability <- (popularity_vec * 0.4) + (tempo * 0.6)
spotify_data$danceability <- danceability
print(spotify_data)

# Long songs: Find songs with a duration longer than 4 minutes (240 seconds).
# and count how many there are.
long_songs <- spotify_data$duration > 240
spotify_data[long_songs, ]
sum(long_songs)  # Count how many

# Song with the highest Danceability Score
# Find the maximum danceability score
max_danceability <- max(spotify_data$danceability)

# Identify the song with the highest danceability
highest_danceability_song <- spotify_data$title[spotify_data$danceability == max_danceability]

# Print the result
cat("The song with the highest danceability score is:", highest_danceability_song, 
    "with a score of", max_danceability, "\n")

# Extract all songs by "Adele" or "Bruno Mars" using a logical vector
adele_or_bruno <- spotify_data$artist %in% c("Adele", "Bruno Mars")

# Subset the data using the logical vector
adele_bruno_songs <- spotify_data[adele_or_bruno, ]

# Print the result
print(adele_bruno_songs)

