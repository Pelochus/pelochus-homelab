from locust import HttpUser, task, between

class WebsiteUser(HttpUser):
    # Tiempo de espera entre tareas (entre 1 y 3 segundos).
    wait_time = between(1, 3)

    @task
    def load_homepage(self):
        self.client.get("/")  # Carga la página principal
