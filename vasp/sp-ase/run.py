#! /usr/bin/env python
# TODO [2019-03-27 Wed] 实现VASP/Siesta等接口
# 可以先用ase来实现.


# [[file:~/Workspace/Programming/structure-predication/reaction-explore/rxexplore.note::*%5B2019-03-27%20Wed%5D%20%E5%AE%9E%E7%8E%B0VASP/Siesta%E7%AD%89%E6%8E%A5%E5%8F%A3][[2019-03-27 Wed] 实现VASP/Siesta等接口:1]]
import json
import ase.io

def set_calculator_for_sp(atoms):
    """single point calculation using dftb calculator

    Parameters
    ----------
    atoms: the ase Atoms object to be set
    """
    import os
    os.environ["VASP_SCRIPT"] = "/share/apps/vasp/bin/run.py"
    os.environ["VASP_PP_PATH"] = "/share/apps/vasp/pp"

    from ase.calculators.vasp import Vasp

    atoms.set_calculator(Vasp(xc='pbe', encut=300))

def format_atoms_for_gosh_model(atoms):
    e = atoms.get_total_energy()
    f = atoms.get_forces()

    print("@model_properties_format_version 0.1\n")
    print("@structure")
    for s, p in zip(atoms.symbols, atoms.positions):
        line = "{:4}".format(s)
        line += "".join(["{:-20.12E}".format(v) for v in p])
        print(line)

    print("\n@energy")
    print("{:10.8}".format(e))
    print("\n@forces")
    for x in f:
        line = "".join(["{:-20.12E}".format(v) for v in x])
        print(line)


def main():
    atoms = ase.io.read("rendered.cif")
    # atoms = ase.io.read("reactant.xyz")
    set_calculator_for_sp(atoms)
    format_atoms_for_gosh_model(atoms)


if __name__ == '__main__':
    main()
# [2019-03-27 Wed] 实现VASP/Siesta等接口:1 ends here
