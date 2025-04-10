import openai

# Set up OpenAI API key
openai.api_key = 'your-api-key'

def generate_test_script(test_description):
    response = openai.Completion.create(
        engine="text-davinci-003",
        prompt=f"Generate a Robot Framework test script for the following test case: {test_description}",
        max_tokens=150
    )
    return response.choices[0].text.strip()

# Example usage
test_description = "Verify that the login functionality works with valid credentials."
test_script = generate_test_script(test_description)
print(test_script)