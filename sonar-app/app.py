import gradio as gr
import requests
import json

PERPLEXITY_API_URL = "https://api.perplexity.ai/chat/completions"


def predict(message, history, token):
    prompt = (
        message
        + "\n\nPlease note that the output is limited to a maximum of 200 words. Please answer without including any links or citations."
    )

    headers = {
        "accept": "application/json",
        "authorization": f"Bearer {token}",
        "content-type": "application/json",
    }
    payload = {
        "model": "sonar",
        "messages": [{"role": "user", "content": prompt}],
        "max_tokens": 500,
    }
    try:
        response = requests.post(PERPLEXITY_API_URL, headers=headers, json=payload)
        response.raise_for_status()
        return response.json()["choices"][0]["message"]["content"]
    except requests.exceptions.RequestException as e:
        return f"Request Error: {e}"
    except Exception as e:
        return f"General Error: {e}"


def chat(message, history, token):
    response = predict(message, history, token)
    history.append({"role": "user", "content": message})
    history.append({"role": "assistant", "content": response})
    return history


with gr.Blocks() as demo:
    token = gr.Textbox(
        label="PERPLEXITY_API_TOKEN", type="password", placeholder="Enter your token"
    )
    chatbot = gr.Chatbot(type="messages")
    msg = gr.Textbox()
    clear = gr.ClearButton([msg, chatbot])

    msg.submit(chat, [msg, chatbot, token], [chatbot])

demo.launch(server_name="0.0.0.0", server_port=7860)
