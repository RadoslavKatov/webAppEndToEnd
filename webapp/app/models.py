from app import db  # Import db from the app package

class Task(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)
    status = db.Column(db.String(20), default='To Do')

    def to_dict(self):
        return {"id": self.id, "title": self.title, "status": self.status}