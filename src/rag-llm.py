from dotenv import load_dotenv
from langchain_ollama import OllamaLLM
from langchain_neo4j import Neo4jGraph, GraphCypherQAChain

def init_graph():
    graph = Neo4jGraph()
    return graph

def init_model():
    llm = OllamaLLM(model="llama3.2", base_url="http://ollama:11434")
    return llm

def run_prompt(prompt, llm, graph):
    chain = GraphCypherQAChain.from_llm(
        llm, graph=graph, verbose=True, allow_dangerous_requests=True
    )
    result = chain.invoke({"query": prompt})
    return result['result']

def main():
    load_dotenv()
    graph = init_graph()
    llm = init_model()
    prompt = "Show me everyone that owns a Project?"
    result = run_prompt(prompt, llm, graph)
    print(result)

if __name__ == "__main__":
    main()
