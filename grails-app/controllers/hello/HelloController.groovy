package hello

class HelloController {
    static responseFormats = ['json', 'html']

    def index() {
        def abc = ["hello":'world!']
        respond abc
    }
}
