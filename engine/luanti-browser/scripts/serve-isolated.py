#!/usr/bin/env python3
"""Serve a directory with the cross-origin isolation headers WASM threads need."""

from argparse import ArgumentParser
from http.server import SimpleHTTPRequestHandler, ThreadingHTTPServer
from pathlib import Path
from functools import partial


class IsolatedHandler(SimpleHTTPRequestHandler):
    def end_headers(self):
        self.send_header("Cross-Origin-Opener-Policy", "same-origin")
        self.send_header("Cross-Origin-Embedder-Policy", "require-corp")
        self.send_header("Cross-Origin-Resource-Policy", "same-origin")
        super().end_headers()


def main():
    parser = ArgumentParser()
    parser.add_argument("directory", nargs="?", default="web/launcher")
    parser.add_argument("--port", type=int, default=8080)
    args = parser.parse_args()
    root = Path(args.directory).resolve(strict=True)
    handler = partial(IsolatedHandler, directory=str(root))
    server = ThreadingHTTPServer(("127.0.0.1", args.port), handler)
    print(f"Serving {root} at http://127.0.0.1:{args.port}")
    server.serve_forever()


if __name__ == "__main__":
    main()

