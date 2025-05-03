#!/usr/bin/python3
import os
import google_auth_oauthlib.flow
import googleapiclient.discovery
import googleapiclient.errors

# API key for the YouTube Data API
API_KEY = "AIzaSyAN9H7weCao0Fv9g81iJCnwmIIGH-wEwQo"  # Replace with your actual API key
# Scopes for the API
scopes = ["https://www.googleapis.com/auth/youtube.force-ssl"]

# Authentication and API client creation for OAuth
def get_authenticated_service():
    # Set to True to allow OAuthlib to work locally
    os.environ["OAUTHLIB_INSECURE_TRANSPORT"] = "1"

    # For a console application, use the console flow
    flow = google_auth_oauthlib.flow.InstalledAppFlow.from_client_secrets_file(
        "/root/googleapi/googlesecret.json",
        scopes
    )

    # This will provide a URL to visit and prompt for the authorization code
    credentials = flow.run_console()
    return googleapiclient.discovery.build("youtube", "v3", credentials=credentials)

# Function to retrieve all videos from a playlist using API key
def get_playlist_videos(playlist_id):
    youtube = googleapiclient.discovery.build("youtube", "v3", developerKey=API_KEY)

    videos = []
    next_page_token = None

    while True:
        request = youtube.playlistItems().list(
            part="snippet",
            playlistId=playlist_id,
            maxResults=50,
            pageToken=next_page_token
        )
        response = request.execute()

        for item in response['items']:
            videos.append((
                item['snippet']['resourceId']['videoId'],
                item['snippet']['title']
            ))

        next_page_token = response.get('nextPageToken')
        if not next_page_token:
            break

    return videos

# Function to add videos to a playlist with a limit using OAuth
def add_videos_to_playlist(youtube, playlist_id, video_ids_titles, limit):
    # First, get existing videos to avoid duplicates
    existing_videos = get_playlist_videos(playlist_id)
    existing_titles = [title for _, title in existing_videos]

    added_count = 0
    for video_id, title in video_ids_titles:
        if added_count >= limit:
            break

        # Check if the video title is already in the playlist
        if title not in existing_titles:
            try:
                request = youtube.playlistItems().insert(
                    part="snippet",
                    body={
                        "snippet": {
                            "playlistId": playlist_id,
                            "resourceId": {
                                "kind": "youtube#video",
                                "videoId": video_id
                            }
                        }
                    }
                )
                response = request.execute()
                print(f"Video '{title}' hinzugefügt")
                added_count += 1
            except googleapiclient.errors.HttpError as e:
                print(f"Error adding video '{title}': {e}")
        else:
            print(f"Video '{title}' ist bereits in der Playlist")

def main():
    try:
        youtube = get_authenticated_service()
        source_playlist_id = "PLEriNQTcrTqbmu2uwv6JjI8fsFmCDmOxB"
        target_playlist_id = "PLG0oGAcU-2wDNs-o_z2_SWAaMus0TTHJh"
        max_videos_to_add = 10  # Set the limit for the number of videos to add

        print("Fetching source playlist videos...")
        source_videos = get_playlist_videos(source_playlist_id)
        print(f"Found {len(source_videos)} videos in source playlist")

        print(f"Adding up to {max_videos_to_add} videos to target playlist...")
        add_videos_to_playlist(youtube, target_playlist_id, source_videos, max_videos_to_add)
        print("Operation completed")

    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    main()