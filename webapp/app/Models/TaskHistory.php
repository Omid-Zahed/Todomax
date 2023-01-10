<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * @property int $id
 * @property int $task_id
 * @property int $user_id
 * @property $attached_at
 * @property $detached_at
 */
class TaskHistory extends Model
{
    use HasFactory;
}
