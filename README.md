# User Data Handling App

A Flutter application that fetches user data from the [DummyJSON API](https://dummyjson.com/users) and displays it in a list. This project demonstrates how to make HTTP requests using Dio, parse JSON data, implement error handling, and cache data locally using `shared_preferences`.

---

## Features

- **Fetch User Data**:
  - Fetches user data from the [DummyJSON API](https://dummyjson.com/users).
  - Displays user details such as name, age, email, and profile image.

- **View User Details**:
  - Navigate to a details page to view more information about a selected user.
  - Caches only the users whose details have been viewed (no duplicates).

- **Profile Page**:
  - Displays a list of users whose details have been viewed.
  - Allows clearing the cache to remove all viewed users.

- **Error Handling**:
  - Displays error messages if the API call fails or if no cached users are found.

- **Loading Indicator**:
  - Shows a loading indicator while fetching data.
    
-  **Avoiding Duplicates**:
   - Added a note about how the app avoids caching duplicate users.
     
-  **Clear Cache Feature**:
   - Added a section explaining how the cache can be cleared from the **Profile Page**.
     
---

## Output:

![Screenshot 2025-01-14 223408](https://github.com/user-attachments/assets/4d9a40f8-900e-4260-ad04-dad97d5af4ea)
![Screenshot 2025-01-14 223421](https://github.com/user-attachments/assets/99826485-f4a2-4e8f-a8fb-0fd0214f07b4)
![Screenshot 2025-01-14 224407](https://github.com/user-attachments/assets/697fe8da-785f-4811-a730-e0c444e338bc)
![Screenshot 2025-01-14 224432](https://github.com/user-attachments/assets/e0fe253f-89d6-484c-8c44-a67c859afb5c)
![Screenshot 2025-01-14 224419](https://github.com/user-attachments/assets/7eeb7fc4-3d39-4b98-a8c6-a3bb3c8f9e93)
![Screenshot 2025-01-14 224512](https://github.com/user-attachments/assets/c90ebcaa-0383-4e06-9621-be807ba6dac9)

https://github.com/user-attachments/assets/39ecab6d-8349-4475-9746-04420ea0b495


