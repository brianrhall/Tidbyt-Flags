load("render.star", "render")
load("encoding/base64.star", "base64")

FLAG_USA = base64.decode("""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""")

FLAG_ARMENIA = base64.decode("""iVBORw0KGgoAAAANSUhEUgAAAEQAAAAkCAYAAAAw55zoAAAAAXNSR0IArs4c6QAAAXhJREFUaEPtms1Kw0AUhc9NXGhV3AmubV1bH0YFQZ+tgqA+jO1WfABxKfVv01yZJBMzY5pUKEi4J5tk0fzMN2fOuXOpgEdAQMgjJFABecK2AmqQjyBBgkPMcxY1IAMFFgASU1AUGQQbGOG9CYhFhRRAhgTiFwKBRJZAIATSnhJLFbKlQGYqYfxgBSmG+AhT5hH7JRAXu1bAFGN1QI7wEseuU4jdY4RPAqlP/y8gOLlRqBOJA2VFLOVYRYCHi1AhB+OJ6kKtVe65XUoqeJ5ehUAwvi4VYtBHnEKmlwRSTT2BRKuAQAik3RiXKsSnjCtUfZ+ofr2q3/bhfv+N7pw2merxxErx0Tytszh2CSSM3fmdmfK0USG7Z0V/uWoyE0gE5PXW7XZ/bCSRr5xkppurWmmPfyfYO492u1QIl0ygaHpItMAJhEDaPZ8KoUL+qJC3e2jVUu2oKLr+VNLVmf3v+4PhKeA2uzunUez2uKpa66d3TdZaX9aHh30DZ5qfJYQysIsAAAAASUVORK5CYII=""")

FLAG_FINLAND = base64.decode("""iVBORw0KGgoAAAANSUhEUgAAADwAAAAmCAYAAACYsfiPAAAAAXNSR0IArs4c6QAAAftJREFUaEPtWc0rRFEU/937jGGKlLCRxfjaIhZKmo2NLK0sfM1k7R8QsrCh7EiUlX/CRiKJFfKKWCgLpBiaycy8e/UM6s2T7r3zGLz71uedc3/n/M7XvQQ++4jP8OIDMOecy4JnjIFSiu3dI3T3rqChtQpnjxmAvKklQE2A4sZMIDYUxtJ8DJQQ2JbeRWRtqsoTkrWoAct4UEdYU1rnsC5aMjUjH1ldpXUfFuDPn25LFrPkJy2Lo6jIwNbOISJ9q59OWtUBglsziehgGItzUVBKkB21BDzqoYhBjfwnrffz7B2Y6OxZRGNbDU7j6U9Hy7GRBizNRT2EIKfKVbTW1jfkI8w4gsUBHJtXmF0+QWVdEHcZp5oQBRJPFrqayjDa31KwtjQ80OOMMKkYlwac9TEHaAnKm0N4SDP3VsA5ig2CVJKBXMblwuKhNL9fcAIOR2aUANs7yFOK4/rZAl7zM+eUthmWBV1bangIQU7VxeaEEzDaJ5UAv5oV3fXkN1A5VF9JH0znAO6YUgfs3bG+T9P+lN8B50NpUVr/JkrXKxQtOwcMQhBPMeGiZfPK/u+H5w6c5xYt37Ul3w0eKtvSnx4t9fIg0BFV10MB1Z6L6BsPlRxWjbB+efCcwG6FmtKa0gI00zms35b021LBLvFcVVogZf+FyE+vpQV32gs/rmBF6CeX1wAAAABJRU5ErkJggg==""")

FLAG_UKRAINE = base64.decode("""iVBORw0KGgoAAAANSUhEUgAAADcAAAAmCAYAAABgUQN4AAAAAXNSR0IArs4c6QAAANxJREFUaENjZBjGgHEY+40B4bno3f+HjUeXuoL9Neq5IRejozE35KIM6uDRmBuNuUEYAqPJchBGClFOGo05ooJpECoaUTHHOIwazv/RY44vZtew6RV8WuKG1isI3zNsPMew0gXVc84ZW4aN5/bO8EH13LfzesPGc1yGl1A99/86w7DxHKMmpBMO74n/u8I+bDzHpPMTLeauMg4bzzFq/x/13CBsWxF20mjMEQ6jwaliNOYGZ7wQdtVozBEOo8GpYjTmBme8EHbVaMwRDqPBqWJkxdzgjAPKXDWs58QBjxx5J4bBsA0AAAAASUVORK5CYII=""")

def main():
    return render.Root(
        child = render.Stack(
            children = [

                # top row
                render.Column(
                    main_align = "start",  # this controls position of children, start = top
                    expanded = True,
                    children = [

                        # row to hold text with equal space between them
                        render.Row(
                            main_align = "space_around",
                            cross_align = "center",
                            expanded = True,
                            children = [
                                render.Image(FLAG_USA, width=28, height=16),
                                render.Image(FLAG_ARMENIA, width=28, height=16),
                            ],
                        ),
                    ],
                ),

                # bottom row
                render.Column(
                    main_align = "end",  # bottom
                    expanded = True,
                    children = [

                        # row to hold text evenly distributed across the row
                        render.Row(
                            main_align = "space_around",
                            cross_align = "center",
                            expanded = True,
                            children = [
                                render.Image(FLAG_FINLAND, width=28, height=16),
                                render.Image(FLAG_UKRAINE, width=28, height=16),
                            ],
                        ),
                    ],
                ),

            ],
        ),
    )
