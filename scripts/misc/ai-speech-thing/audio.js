#!/usr/bin/env node

const RATE = 14;

import { Client } from "@gradio/client";

const response_0 = await fetch("https://github.com/gradio-app/gradio/raw/main/test/test_files/audio_sample.wav");
const exampleAudio = await response_0.blob();

const client = await Client.connect("http://localhost:7860/");
const result = await client.predict("/generate_audio", {
    model_choice: "Zyphra/Zonos-v0.1-transformer",
    text: process.argv[2],
    language: "en-us",
    speaker_audio: exampleAudio,
    prefix_audio: undefined,
    e1: 0.05,
    e2: 0.05,
    e3: 0.05,
    e4: 0.05,
    e5: 0.05,
    e6: 0.05,
    e7: 0.1,
    e8: 0.6,
    vq_single: 0.78,
    fmax: 24000,
    pitch_std: 45,
    speaking_rate: RATE,
    dnsmos_ovrl: 4,
    speaker_noised: true,
    cfg_scale: 2,
    min_p: 0.15,
    seed: 3,
    randomize_seed: true,
    unconditional_keys: ["speaker"],
});

console.log(result.data[0].path);
