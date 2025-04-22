<script module lang="ts">

let API_URL = "http://localhost:11434/api/generate";
let model = "qwen2.5-coder:1.5b";


async function make_request(): Promise<Response> {
    return fetch(API_URL, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            model: model,
            prompt: "Hello world",
            stream: true
        }),
    });
}

async function* decode_response(body: ReadableStream<Uint8Array<ArrayBufferLike>>) {
    const reader = body.getReader();
    const decoder = new TextDecoder('utf-8');
    let partialLine = '';
    try {
        while (true) {
            const { value, done } = await reader.read();

            if (done) {
                if (partialLine.trim() !== '') {
                    try {
                        const finalData = JSON.parse(partialLine);
                        if (finalData.response) {
                            yield finalData.response;
                        }
                    } catch(e) {
                        console.error("Last line decoding error:", e, "Line:", partialLine);
                    }
                }
                break;
            }

            const chunk = decoder.decode(value, { stream: true });
            partialLine += chunk;

            const lines = partialLine.split('\n');
            partialLine = lines.pop() || '';

            for (const line of lines) {
                if (line.trim() === '') continue;

                try {
                    const data = JSON.parse(line);

                    if (data.response) {
                        yield data.response;
                    }

                } catch (e) {
                    console.error("JSON parsing error:", e, "Line:", line);
                }
            }
        }
    } catch (error) {
        console.error("Error during decoding", error);
    } finally {
        if (reader && !reader.closed) {
            reader.releaseLock();
        }
    }
}

export async function* generate() {
    try {
        const response = await make_request();

        if (!response.ok) {
            const errorBody = await response.text();
            console.error(`HTTP Error: ${response.status}, ${response.statusText}. Corps: ${errorBody}`);
            return;
        }

        if (!response.body) {
            console.error("API Response has no body :'(");
            return;
        }

        yield* decode_response(response.body);
    } catch (err) {
        console.error("Error during fetch:", err);
    }
}

</script>
