<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * @property string $title
 * @property string $description
 * @property int $id
 * @property string $background_color
 */
class Board  extends Model
{
    use HasFactory;
}
