from google import genai
import os

# Retrieve the Google AI API key from environment variables
google_api_key = os.environ.get("GOOGLE_AI_API_KEY")

# Initialize the Google AI client with the API key
client = genai.Client(api_key=google_api_key)

# Define the prompt for generating the Dockerfile content
PROMPT = """
I need a docker file which performs the following action. Please don't provide any description.

- base image of python - slim version
- copy the code to the work directory
- install the pip packages by referring requirements.txt
- runs the python script named app.py

"""

# Generate content using the specified model and prompt
response = client.models.generate_content(
    model="gemini-2.0-flash", contents=PROMPT
)

# Print the generated content
print(response.text)