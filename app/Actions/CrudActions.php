<?php

namespace App\Actions;

use Exception;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Log;

class CrudActions
{
    protected $model;
    public function __construct(Model $model)
    {
        $this->model = $model;
    }

    public function get($id){
        try {
            return $this->model->find($id);
        } catch (Exception $e) {
            Log::error('Create operation failed: ' . $e->getMessage());
            throw $e;
        }
    }

    public function create(array $data)
    {
        try {
            return $this->model->create($data);
        } catch (Exception $e) {
            Log::error('Create operation failed: ' . $e->getMessage());
            throw $e;
        }
    }

    public function read(array $conditions = [], array $relations = [])
    {
        try {
            $query = $this->model->query();

            if (!empty($relations)) {
                $query->with($relations);
            }

            if (!empty($conditions)) {
                $query->where($conditions);
            }

            return $query->get();
        } catch (Exception $e) {
            Log::error('Read operation failed: ' . $e->getMessage());
            throw $e;
        }
    }


    public function update(int $id, array $data): bool
    {
        try {
            $resource = $this->model->findOrFail($id);
            return $resource->update($data);
        } catch (Exception $e) {
            Log::error('Update operation failed: ' . $e->getMessage());
            throw $e;
        }
    }

    public function delete(string $id): ?bool
    {
        try {
            $resource = $this->model->findOrFail($id);
            return $resource->delete();
        } catch (Exception $e) {
            Log::error('Delete operation failed: ' . $e->getMessage());
            throw $e;
        }
    }
}
