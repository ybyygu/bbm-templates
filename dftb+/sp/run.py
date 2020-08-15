def set_dftb_calculator_for_sp(atoms):
    """single point calculation using dftb calculator

    Parameters
    ----------
    atoms: the ase Atoms object to be set
    """
    import os
    os.environ["DFTB_COMMAND"] = "dftb+"
    os.environ["DFTB_PREFIX"] = "/home/ybyygu/Incoming/liuxc-dftb+/dftb-params/3ob-3-1"

    from ase.calculators.dftb import Dftb

    atoms.set_calculator(Dftb(atoms=atoms,
                              Hamiltonian_MaxAngularMomentum_C='"p"',
                              Hamiltonian_MaxAngularMomentum_O='"p"',
                              Hamiltonian_MaxAngularMomentum_N='"p"',
                              Hamiltonian_MaxAngularMomentum_H='"s"',
    ))

def ase_results_to_json(calculator):
    """convert ase calculator results to json"""
    d = {}
    for k, v in calculator.results.items():
        # convert numpy array to plain list
        if k in ("forces", "dipole", "stress", "charges", "magmoms"):
            d[k] = v.tolist()
        else:
            d[k] = v
    return json.dumps(d)

