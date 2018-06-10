<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Redirect;

class CheckRole
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if ($request->user() === null) {
//            return response("Insufficient permissions", 401);
            flash('Insufficient permissions!', 'danger');
            return Redirect::route('main');
        }
        $actions = $request->route()->getAction();
        $roles = isset($actions['roles']) ? $actions['roles'] : null;

        if ($request->user()->hasAnyRole($roles) || !$roles) {
            return $next($request);
        }
//        return response("Insufficient permissions", 401);
        flash('Insufficient permissions!', 'danger');
        return Redirect::route('main');
    }
}