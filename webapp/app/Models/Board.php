<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * @property $description
 * @property $id
 * @property $background
 * @preperty $user_id
 * @preperty $workspace_id
 * @preperty $name
 */
class Board  extends Model
{
    use HasFactory;
}
