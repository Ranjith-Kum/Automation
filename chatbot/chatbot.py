import streamlit as st
from PyPDF2 import PdfReader
from langchain_text_splitters import RecursiveCharacterTextSplitter
from langchain.embeddings import OpenAIEmbeddings
from langchain.vectorstores import FAISS
from langchain.chains.question_answering import load_qa_chain
from langchain_community.chat_models import ChatOpenAI
import os


OPENAI_API_KEY = "sk-1234567890abcdef1234567890abcdef"
# Chatbot title
st.header("RK Chatbot")

# Upload pdf files
with st.sidebar:
    st.title("Upload Documents")
    file = st.file_uploader("Choose a PDF file", type="pdf")

# Get User questions
user_question = st.text_input("Type your question here")

# Extract the text from the pdf file
if file is not None:
    reader = PdfReader(file)
    text = ""
    for page in reader.pages:
        text += page.extract_text()
    # st.write(text)

    # Break it all into chunks
    text_splitter = RecursiveCharacterTextSplitter(
        separators="\n",
        chunk_size=1000,
        chunk_overlap=150,
        length_function=len
    )
    text_chunks = text_splitter.split_text(text)
    # st.write(text_chunks)
    
    # Generating the embeddings
    embeddings = OpenAIEmbeddings(openai_api_key=OPENAI_API_KEY)

    # Creating vector store using FAISS
    vector_store = FAISS.from_texts(text_chunks, embeddings)

    # Do similarity search
    if user_question:
        results = vector_store.similarity_search(user_question)
        # st.write(results)

        # Display the results
        # can adjust the values of the argument for fine tuning
        llm = ChatOpenAI(openai_api_key=OPENAI_API_KEY,temperature=0.5, max_tokens=1000, model_name="gpt-3.5-turbo")
        chain = load_qa_chain(llm, chain_type="stuff")
        response = chain.run(input_documents = results, question = user_question)
        st.write(response)

        
        # Set environment variable for OpenAI API key
        os.environ["OPENAI_API_KEY"] = OPENAI_API_KEY
