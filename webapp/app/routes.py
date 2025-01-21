from flask import Blueprint, jsonify, request
from app import db  # Import db directly from app
from app.models import Task  # Import Task from models

bp = Blueprint('routes', __name__)

@bp.route('/tasks', methods=['GET'])
def get_tasks():
    tasks = Task.query.all()
    return jsonify([task.to_dict() for task in tasks])

@bp.route('/tasks', methods=['POST'])
def create_task():
    data = request.json
    task = Task(title=data['title'])
    db.session.add(task)
    db.session.commit()
    return jsonify(task.to_dict()), 201

@bp.route('/', methods=['GET'])
def home():
    return jsonify({"message": "Welcome to the Task Manager API!"})

@bp.route('/tasks/<int:task_id>', methods=['PUT'])
def update_task(task_id):
    data = request.json
    task = Task.query.get_or_404(task_id)
    task.title = data.get('title', task.title)
    task.status = data.get('status', task.status)
    db.session.commit()
    return jsonify(task.to_dict())

@bp.route('/tasks/<int:task_id>', methods=['DELETE'])
def delete_task(task_id):
    task = Task.query.get_or_404(task_id)
    db.session.delete(task)
    db.session.commit()
    return jsonify({"message": "Task deleted"}), 204