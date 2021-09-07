<script>
  import { onMount } from "svelte";

  let empleados = [];
  let editar = false;
  let datosEmpleado = {
    id: null,
    nombre: "",
    correo: "",
  };

  const getUsuarios = async () => {
    const res = await fetch(`http://localhost:8000`);
    empleados = await res.json();
  };

  const agregarEmpleado = async () => {
    const nuevoEmpleado = {
      ...datosEmpleado,
    };
    const res = await fetch(`http://localhost:8000/?insertar=1`, {
      method: "POST",
      body: JSON.stringify(nuevoEmpleado),
    });

    const empleado = await res.json();

    datosEmpleado.id = null;
    datosEmpleado.nombre = "";
    datosEmpleado.correo = "";

    getUsuarios();
  };

  const borrarEmpleado = async (id) => {
    const res = await fetch(`http://localhost:8000/?borrar=${id}`, {
      method: "POST",
    });
    const empleado = await res.json();
    getUsuarios();
  };

  const editarEmpleado = (empleado) => {
    datosEmpleado.id = empleado.id;
    datosEmpleado.nombre = empleado.nombre;
    datosEmpleado.correo = empleado.correo;
    editar = true;
  };

  const actualizarEmpleado = async (id) => {
    const empleadoEditado = {
      ...datosEmpleado,
    };

    const res = await fetch(`http://localhost:8000/?actualizar=${id}`, {
      method: "POST",
      body: JSON.stringify(empleadoEditado),
    });
    const empleado = await res.json();
    getUsuarios();
    editar = false;
    datosEmpleado.id = null;
    datosEmpleado.nombre = "";
    datosEmpleado.correo = "";
  };

  onMount(() => {
    getUsuarios();
  });
</script>

<div class="container mt-5">
  <div class="row">
    <div class="col-md-5">
      <div class="card">
        <div class="card-header">Empleados</div>
        <div class="card-body">
          <form>
            <div class="mb-3">
              <label for="" class="form-label">ID</label>
              <input
                type="text"
                class="form-control"
                name="id"
                id=""
                aria-describedby="helpId"
                bind:value={datosEmpleado.id}
              />
            </div>

            <div class="mb-3">
              <label for="" class="form-label">Nombre</label>
              <input
                type="text"
                class="form-control"
                name="nombre"
                aria-describedby="helpId"
                placeholder="Escriba su nombre"
                bind:value={datosEmpleado.nombre}
              />
            </div>

            <div class="mb-3">
              <label for="" class="form-label">Email</label>
              <input
                type="text"
                class="form-control"
                name="correo"
                id=""
                aria-describedby="helpId"
                placeholder="Escriba su correo"
                bind:value={datosEmpleado.correo}
              />
            </div>

            <button
              type="button"
              class="btn btn-primary"
              on:click|preventDefault={agregarEmpleado}>Agregar Empleado</button
            >
            {#if editar}
              <button
                type="button"
                class="btn btn-primary"
                on:click={actualizarEmpleado(datosEmpleado.id)}
                >Actualizar
              </button>
            {/if}
          </form>
        </div>
      </div>
    </div>
    <div class="col-md-7">
      <table class="table">
        <thead>
          <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Correo</th>
            <th>Acciones</th>
          </tr>
        </thead>
        <tbody>
          {#each empleados as empleado}
            <tr>
              <td>{empleado.id}</td>
              <td>{empleado.nombre}</td>
              <td>{empleado.correo}</td>
              <td
                ><button
                  type="submit"
                  class="btn btn-primary"
                  on:click={editarEmpleado(empleado)}>Editar</button
                >
                |
                <button
                  type="button"
                  class="btn btn-danger"
                  on:click={borrarEmpleado(empleado.id)}>Borrar</button
                ></td
              >
            </tr>
          {:else}
            <p>Loading...</p>
          {/each}
        </tbody>
      </table>
    </div>
  </div>
</div>
